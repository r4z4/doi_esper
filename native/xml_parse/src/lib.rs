use rustler::{NifStruct, NifResult};
use libxml::{parser, xpath::Context};

#[derive(Debug, NifStruct)]
#[module = "DoiExper.Sales.Sale"]

struct Sale {
    year: i32,
    month: i32,
    supplier: String,
    item_code: i32,
    item_description: String,
    item_type: String,
    retail_sales: f32,
    retail_transfers: f32,
    warehouse_sales: i32
}

#[derive(Debug, NifStruct)]
#[module = "DoiEsper.Sales.TownData"]
struct TownData {
    year: i32,
    code: i32,
    town: String,
    _2010_census: i32,
    gov_assisted: i32,
    tenant_rental_assistance: i32,
    chfa_usda_mortgages: i32,
    deed_restricted: i32,
    total_assisted: i32,
    percent_assisted: f64,
}


#[rustler::nif]
fn add(a: i64, b: i64) -> i64 {
    a + b
}

#[rustler::nif]
fn parse(xml_data: String) -> NifResult<Vec<TownData>>{
    let parser = parser::Parser::default();
    let doc = parser.parse_string(xml_data);
    if doc.is_err() {
        panic!("Doc Parse Error")
    }
    let doc_uw = doc.unwrap();
    let mut context = Context::new(&doc_uw);
    if context.is_err() {
        panic!("Context Error")
    }
    let mut context_uw = context.unwrap();
    let town_nodes = context_uw.evaluate("//row");
    if town_nodes.is_err() {
        panic!("Town Nodes Err")
    }
    let town_nodes_uw = town_nodes.unwrap();
    let town_nodes_vec = town_nodes_uw.get_nodes_as_vec();
    // We know how big the Vec will be, so we can set capacity
    let mut towns: Vec<TownData> = Vec::with_capacity(town_nodes_vec.len());
    for node in town_nodes_vec {
        // Start from this person node
        context_uw.set_context_node(&node);
        let year = get_num(&context_uw, "./year/text()");
        let code = get_num(&context_uw, "./code/text()");
        let town = get_text(&context_uw, "./town/text()");
        let _2010_census = get_num(&context_uw, "./_2010_census/text()");
        let gov_assisted = get_num(&context_uw, "./gov_assisted/text()");
        let tenant_rental_assistance = get_num(&context_uw, "./tenant_rental_assistance/text()");
        let chfa_usda_mortgages = get_num(&context_uw, "./chfa_usda_mortgages/text()");
        let deed_restricted = get_num(&context_uw, "./deed_restricted/text()");
        let total_assisted = get_num(&context_uw, "./total_assisted/text()");
        let percent_assisted = get_float(&context_uw, "./percent_assisted/text()");
        towns.push(TownData {year, code, town, _2010_census, gov_assisted, tenant_rental_assistance, chfa_usda_mortgages, deed_restricted, total_assisted, percent_assisted});
    }
    Ok(towns)
}

fn get_text(context: &Context, xpath: &str) -> String {
    let object = context.evaluate(xpath).unwrap();
    object.to_string()
}

fn get_num(context: &Context, xpath: &str) -> i32 {
    get_text(context, xpath).parse::<i32>().unwrap()
}

fn get_float(context: &Context, xpath: &str) -> f64 {
    get_text(context, xpath).parse::<f64>().unwrap()
}

rustler::init!("Elixir.DoiEsper.XmlParse", [add, parse]);
