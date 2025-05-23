use reqwest::blocking::get;
use std::{env, thread, time};

// let now = time::Instant::now();

fn main() {
    // set url from argv cmdl
    let args: Vec<string> = env::args().collect();
    if args.len() < 2 {
        eprintln!("Usage: {} <url>", args[0]);
        std::process::exit(1);
    }

    let url = &args[1];
    if !url.starts_with("http://") && !url.starts_with("https://") {
        eprintln!("Error: URL must start with http:// or https://");
        std::process::exit(1);
    }

    let stop = false;
    let interval: u64 = 3600;
    let pause_time = time::Duration::from_secs(interval);
    let mut times_ran: u8 = 0;
    let mut response_total: u8 = 0;

    loop {
        times_ran += 1;
        let response_code: u8 = ping(url);
        response_total = response_total + response_code;
        display(url, interval, response_total, times_ran, None);
        if stop == true {
            display(url, interval, response_total, times_ran, Some(true));
            break;
        }
        thread::sleep(pause_time);
    }
}

fn ping(url: &str) -> u8 {
    match get(url) {
        Ok(resp) => {
            if resp.status().is_success() {
                println!("Website is up! Status: {}", resp.status());
                return 1;
            } else {
                println!("Website responded with status: {}", resp.status());
                return 0;
            }
        }
        Err(e) => {
            println!("Failed to reach website: {}", e);
            return 0;
        }
    }
}

fn display(url: &str, ping_intervals: u64, response_total: u8, runs: u8, complex: Option<bool>) {
    let complex = complex.unwrap_or(false);
    let website = url
        .strip_prefix("https://")
        .or_else(|| url.strip_prefix("http://"))
        .map(|u| u.strip_prefix("www.").unwrap_or(u))
        .unwrap_or(&url);
    let intervals = ping_intervals / 3600;
    let percent = if runs == 0 {
        0
    } else {
        (response_total as f32 / runs as f32 * 100.0).round() as u8
    };
    if complex {
        println!("{website} has a {percent}% Uptime at {intervals} an hour");
    } else {
        println!("site: {website};\tuptime {percent}%;\tintervals {intervals}/h;");
    }
}
