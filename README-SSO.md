# general reference for spring security

# reference
https://github.com/spring-projects/spring-security-samples/blob/ff551021baff1ea65975a2d9fa65bb60f54d813f/servlet/spring-boot/java/oauth2/login/README.adoc#L219


# running locally with no security  * * * * * * * * * * * 

```
unset SPRING_PROFILES_ACTIVE
mvn spring-boot:run
```
# running locally with a local in-memory Identity provider * * * * * * * * * 

```
export SPRING_PROFILES_ACTIVE=local
mvn spring-boot:run
```



# running locally with github oauth2 * * * * * * * *
#### tutorial using github oauth2
https://github.com/spring-guides/tut-spring-boot-oauth2


* login into  github
* following these instructions: https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/creating-an-oauth-app 
     * use http://localhost:8080 as both the homepage URL and the Authorization Callback URL 

cp and edit set_github_oauth2_vars, adding your client_id and secret
```
cp set_github_oauth_vars_template.sh set_github_oauth_vars.sh
```
run the newly created script
```
source set_github_oauth_vars.sh
```
now launch the application
```
mvn spring-boot:run
```

