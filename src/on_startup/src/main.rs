use chrono::Local;
use colored::*;
use serde::Deserialize;
use std::fs::File;
use std::io::BufReader;
use std::path::PathBuf;

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

    // get $HOME
    let mut path: PathBuf = dirs::home_dir().ok_or("Could not determine home directory")?;

    path.push(".bash-salt/config.json");
    // Open the file
    let file = File::open(&path)?;
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
