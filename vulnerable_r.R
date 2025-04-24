# Hardcoded credentials
api_key <- "sk_test_1234567890abcdef"
db_user <- "admin"
db_pass <- "password123"

# SQL injection vulnerability
user_input <- "'; DROP TABLE users;--"
query <- paste0("SELECT * FROM users WHERE name = '", user_input, "'")
print(paste("Running query:", query))

# Dangerous eval usage
input_code <- "system('rm -rf /')"
eval(parse(text = input_code))  # 🔥 Very bad idea

# Insecure file write without sanitizing input
filename <- paste0("/tmp/", user_input, ".txt")
writeLines("Some data", con = filename)

# System command injection
user_command <- "ls; echo hacked"
system(user_command)

# Deprecated or dangerous function
assign("x", 42)
attach(mtcars)  # Discouraged practice

# HTTP without HTTPS
url <- "http://example.com/data.csv"
download.file(url, destfile = "data.csv")

# Improper input validation
get_age <- function(input) {
  if (!is.numeric(input)) {
    print("Invalid input")  # Should stop or sanitize
  }
  return(as.integer(input))
}
age <- get_age("twenty")

# No authentication check
upload_to_cloud <- function(file) {
  print(paste("Uploading", file, "to cloud storage..."))
  # ...no auth, encryption, or verification
}
upload_to_cloud("secrets.txt")
