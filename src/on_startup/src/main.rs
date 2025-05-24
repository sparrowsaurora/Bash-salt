use chrono::Local;
use colored::*;
use serde::Deserialize;
use std::fs::File;
use std::io::BufReader;

#[derive(Deserialize)]
struct Config {
    profile: Profile,
    // details: Details,
    // version: String,
}

#[derive(Deserialize)]
struct Profile {
    username: String,
    // email: String,
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    // Gen current time
    let now = Local::now();

    // Open the file
    let file = File::open("../../src/config.json")?;
    let reader = BufReader::new(file);

    // Parse the JSON into your struct
    let config: Config = serde_json::from_reader(reader)?;

    // Access the fields
    println!("Welcome Back, {}", config.profile.username.underline());
    println!(
        "It is currently: {}",
        now.format("%H : %M").to_string().bold()
    );

    Ok(())
}
