use image::io::Reader as ImageReader;
use image::codecs::jpeg::JpegEncoder;
use std::fs::File;

#[rustler::nif(schedule = "DirtyCpu")]
fn jpg(input: String, output: String, quality: i64) -> Result<String, String> {
    let img = ImageReader::open(&input).unwrap().decode().unwrap();
    let out_file = std::fs::File::create(&output).unwrap();
    let mut jpg = JpegEncoder::new_with_quality(&out_file, quality as u8);

    jpg.encode_image(&img).unwrap();
    Ok(output.to_string())
}

// add code...

rustler::init!("Elixir.DoiEsper.ImageEncode", [jpg]);
