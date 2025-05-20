use indicatif::{ProgressBar, ProgressStyle};
use prettytable::{row, Table};
use std::io::Read;
use std::time::{Duration, Instant};
use ureq;

fn main() {
    println!("Running Speed Test");

    let test_file_url = "http://ipv4.download.thinkbroadband.com/10MB.zip";

    // Show Progrss Bar -|
    let bar = ProgressBar::new_spinner();
    bar.set_style(
        ProgressStyle::default_spinner()
            .template("{spinner:.green} {msg}")
            .expect("Invalid progress bar template"),
    );
    bar.enable_steady_tick(Duration::from_millis(100));
    bar.set_message("Downloading Test File...");

    // Starting Timer -|
    let start = Instant::now();

    // Make HTTP GET Request -|
    let response_result = ureq::get(test_file_url).call();

    // Check for Errors -|
    if let Err(e) = &response_result {
        eprintln!("Request failed: {:?}", e);
        return;
    }

    let response = response_result.unwrap();

    // Read Response to memory to measure speed -|
    let mut reader = response.into_reader();
    let mut buffer = [0u8; 8192];
    let mut _total_bytes = 0;

    while let Ok(n) = reader.read(&mut buffer) {
        if n == 0 {
            break;
        }
        _total_bytes += n;
    }

    // Stop Timer -|
    let duration = start.elapsed();
    bar.finish_with_message("Test Complete");

    let seconds = duration.as_secs_f64();
    let file_size_mb = 10.0;
    let speed_mbps = file_size_mb / seconds;

    // Return Results -|
    let mut table = Table::new();
    table.add_row(row!["Metric", "Values"]);
    table.add_row(row!["Download Time (s)", format!("{:.2}", seconds)]);
    table.add_row(row!["Speed (MB/s)", format!("{:.2}", speed_mbps)]);
    table.add_row(row!["Speed (Mbps)", format!("{:.2}", speed_mbps * 8.0)]);
    table.printstd();
}
