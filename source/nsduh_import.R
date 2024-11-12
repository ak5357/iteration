nsduh_import = function(drug_name, table_n, html){
  out_table =
    html |> 
    html_table() |> 
    nth(table_n) |> 
    slice(-1) |>
    mutate(drug = drug_name) |> 
    relocate(drug) |> 
    select(-contains("P Value"))
  
  return(out_table)
}