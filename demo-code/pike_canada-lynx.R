landscape_name = "pike" #landscape for QWRA, demo on the Pike San Isabel landscape
hvra_name = "canada-lynx" #name of the highly valuable resource or asset you want to assess
rf.data = read.csv(here::here("demo-data", "global_canada-lynx_disturbance-rf.csv")) #example hvra response function for Canada Lynx
rf.values = rf.data$rf_value

output_basename = glue::glue("{landscape_name}_{hvra_name}_fire-hazard-report-card.html")
output_local_fname = here::here("docs", output_basename)

dir.create(dirname(output_local_fname), showWarnings = FALSE)

params = list(
  landscape_name = landscape_name, 
  hvra_vector_fname = here::here("demo-data", glue::glue("{landscape_name}_{hvra_name}_footprint.gpkg")),
  flp_fname = glue::glue("s3://vp-sci-grp/prototypes/reportcard/interim/landscapes/{landscape_name}/flp.tif"),
  outyear_bp_fname = glue::glue("s3://vp-sci-grp/prototypes/reportcard/interim/landscapes/{landscape_name}/outyear_burn_probability.tif"),
  aoi_fname = here::here("demo-data", glue::glue("{landscape_name}_aoi.gpkg")),
  rf = rf.values
)
  
tictoc::tic()
rmarkdown::render(
  input = here::here("demo-code", "fire-hazard-per-hvra-on-a-landscape.Rmd"), 
  params = params, 
  output_file = output_local_fname
)
tictoc::toc()