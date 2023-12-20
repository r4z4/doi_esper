use rustler::{NifStruct, NifResult};

#[derive(Debug, NifStruct)]
#[module = "DoiExper.Sales.Sale"]

struct Sale {
    year: i32
    month: i32
    supplier: String
    item_code: i32
    item_description: String
    item_type: String
    retail_sales: f32
    retail_transfers: f32
    warehouse_sales: i32
}


#[rustler::nif]
fn add(a: i64, b: i64) -> i64 {
    a + b
}

fn parse(xml_data: String) -> NifResult<Vec<Sale>>{

}

rustler::init!("Elixir.DoiEsper.XmlParse", [add]);
