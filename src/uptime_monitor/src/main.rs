use clap::{Arg, Command};
use reqwest::blocking::get;
use std::{thread, time};

fn main() {
    // set url from argv cmdl
    let matches = Command::new("uptime_monitor")
        .about("Checks the uptime of a URL on an interval")
        .arg(
            Arg::new("url")
                .help("The website URL to ping")
                .required(true)
                .index(1),
        )
        .arg(
            Arg::new("interval")
                .short('i')
                .long("interval")
                .help("Interval in minutes between pings")
                .default_value("60")
                .value_parser(clap::value_parser!(u64)),
        )
        .get_matches();

    let url = matches.get_one::<String>("url").unwrap();
    if !url.starts_with("http://") && !url.starts_with("https://") {
        eprintln!("Error: URL must start with http:// or https://");
        std::process::exit(1);
    }
    let interval_minutes = matches.get_one::<u64>("interval").unwrap();
    let interval_secs = interval_minutes * 60;

    let stop = false;
    let interval: u64 = 3600;
    let pause_time = time::Duration::from_secs(interval_secs);
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
