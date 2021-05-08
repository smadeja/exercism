pub fn raindrops(n: u32) -> String {
    let mut sound = String::new();

    if evenly_divisible(n, 3) {
        sound.push_str("Pling");
    }

    if evenly_divisible(n, 5) {
        sound.push_str("Plang");
    }

    if evenly_divisible(n, 7) {
        sound.push_str("Plong");
    }

    if sound.is_empty() {
        sound.push_str(&n.to_string());
    }

    sound
}

fn evenly_divisible(dividend: u32, divisor: u32) -> bool {
    dividend % divisor == 0
}

