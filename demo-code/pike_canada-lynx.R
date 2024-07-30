landscape_name = "pike"
sara_name = "canada-lynx"
dir.root = "~/Library/CloudStorage/GoogleDrive-sophie@vibrantplanet.net/Shared drives/VP - Science Group/"
rf.data = read.csv(paste(dir.root, "projects/rf-generator/response-function-notebooks", sara_name, paste(sara_name, "-de-rf", ".csv", sep=""), sep="/"))
rf.values = rf.data$value

output_basename = glue::glue("fire-hazard_{sara_name}.pdf")
output_local_fname = here::here("Notebooks", sara_name, landscape_name, output_basename)

dir.create(dirname(output_local_fname), showWarnings = FALSE)

output_s3_fname = glue::glue("s3://vp-sci-grp/prototypes/reportcard/processed/landscapes/{landscape_name}/{output_basename}")

params = list(
  landscape_name = landscape_name, 
  sara_vector_s3_fname = "s3://vp-sci-grp/prototypes/reportcard/raw/LynxHbt121115_polys_all.zip",
  sara_raster_s3_fname = "",
  rf = rf.values,
  session_ingest = "",
  session_automation = ""
)
  
tictoc::tic()
rmarkdown::render(
  input = here::here("Notebooks", sara_name, "04_fire-hazard-per-sara-on-a-landscape.Rmd"), 
  params = params, 
  output_file = output_local_fname
)
tictoc::toc()

aws.s3::put_object(
  file = output_local_fname,
  object = output_s3_fname,
  multipart = TRUE
)

