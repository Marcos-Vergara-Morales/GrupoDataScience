#Cración del repositorio GIT para grupo de Data Science

install.packages("usethis")

library(usethis)

install.packages("gitcreds")

library(gitcreds)

usethis:: create_github_token()

gitcreds:: gitcreds_set()

usethis::use_git()

usethis::use_github()


usethis::use_git_remote("https://github.com/Marcos-Vergara-Morales/GrupoDataScience.git", url = NULL, overwrite = TRUE)

usethis::use_git()

