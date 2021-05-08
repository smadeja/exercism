pub fn is_leap_year(year: u64) -> bool {
    if evenly_divisible(year, 100) {
        evenly_divisible(year, 400)
    } else {
        evenly_divisible(year, 4)
    }

}

fn evenly_divisible(dividend: u64, divisor: u64) -> bool {
    dividend % divisor == 0
}
