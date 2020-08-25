pub fn is_armstrong_number(num: u32) -> bool {
    let len = ((num + 1) as f32).log10().ceil() as u32;
    let armstrong: u32 = num.to_string().chars()
        .map(|digit| digit.to_digit(10).unwrap())
        .map(|digit| digit.pow(len))
        .sum();
    armstrong == num
}