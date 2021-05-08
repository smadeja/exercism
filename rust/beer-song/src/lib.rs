pub fn verse(n: u32) -> String {
    let bcc = bottle_count(n, true);
    let bc = bottle_count(n, false);
    let a = action(n);
    let nbc = bottle_count(next_verse_no(n), false);

    format!("{} on the wall, {}.\n{}, {} on the wall.\n", bcc, bc, a, nbc)
}

pub fn sing(start: u32, end: u32) -> String {
    let mut song = String::new();

    for verse_no in (end..=start).rev() {
        if verse_no < start {
            song.push_str("\n")
        }

        song.push_str(&verse(verse_no));
    }

    song
}

fn action(verse_no: u32) -> String {
    if verse_no == 0 {
        String::from("Go to the store and buy some more")
    } else if verse_no == 1 {
        String::from("Take it down and pass it around")
    } else {
        String::from("Take one down and pass it around")
    }
}

fn bottle_count(verse_no: u32, capitalize: bool) -> String {
    if verse_no == 0 {
        if capitalize {
            String::from("No more bottles of beer")
        } else {
            String::from("no more bottles of beer")
        }
    } else if verse_no == 1 {
        String::from("1 bottle of beer")
    } else {
        format!("{} bottles of beer", verse_no)
    }
}

fn next_verse_no(current_verse_no: u32) -> u32 {
    if current_verse_no > 0 {
        current_verse_no - 1
    } else {
        99
    }
}
