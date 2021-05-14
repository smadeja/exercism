pub fn build_proverb(list: &[&str]) -> String {
    let mut iter = list.iter().peekable();
    let mut verses: Vec<String> = Vec::new();

    while let Some(noun_1) = iter.next() {
        match iter.peek() {
            Some(noun_2) => {
                verses.push(verse(noun_1, noun_2));
            }
            None => {
                verses.push(ending(list[0]));
            }
        }
    }

    verses.join("\n")
}

fn verse(noun_1: &str, noun_2: &str) -> String {
    format!("For want of a {} the {} was lost.", noun_1, noun_2)
}

fn ending(noun: &str) -> String {
    format!("And all for the want of a {}.", noun)
}
