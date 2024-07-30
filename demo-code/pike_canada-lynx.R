landscape_name = "pike" #landscape for QWRA, demo on the Pike San Isabel landscape
hvra_name = "canada-lynx" #name of the highly valuable resource or asset you want to assess
dir.root = getwd() #capture your current working directory
rf.data = read.csv(paste(dir.root,"demo-data/canada-lynx-de-rf.csv", sep="/")) #example hvra response function for Canada Lynx
rf.values = rf.data$value

output_basename = glue::glue("fire-hazard_{hvra_name}.pdf")
output_local_fname = here::here(hvra_name, landscape_name, output_basename)

dir.create(dirname(output_local_fname), showWarnings = FALSE)

output_s3_fname = glue::glue("s3://vp-sci-grp/prototypes/reportcard/processed/landscapes/{landscape_name}/{output_basename}") #alter path to a cloud or local location where you want to save these outputs

params = list(
  landscape_name = landscape_name, 
  sara_vector_s3_fname = paste(dir.root,"demo-data/LynxHbt121115_polys_all.zip", sep="/"),
  sara_raster_s3_fname = "",
  rf = rf.values,
  session_ingest = "",
  session_automation = ""
)
  
tictoc::tic()
rmarkdown::render(
  input = here::here("demo-code", "fire-hazard-per-sara-on-a-landscape.Rmd"), 
  params = params#, 
  #output_file = output_local_fname
)
tictoc::toc()

aws.s3::put_object(
  file = output_local_fname,
  object = output_s3_fname,
  multipart = TRUE
)

