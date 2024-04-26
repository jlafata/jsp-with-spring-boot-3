# general reference for spring security

# reference
https://github.com/spring-projects/spring-security-samples/blob/ff551021baff1ea65975a2d9fa65bb60f54d813f/servlet/spring-boot/java/oauth2/login/README.adoc#L219


# running locally with no security

```
unset SPRING_PROFILES_ACTIVE
mvn spring-boot:run
```
# running locally with a local in-memory Identity provider

```
export SPRING_PROFILES_ACTIVE=local
mvn spring-boot:run
```



# running locally with github oauth2
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


# running on azure  [ untested ]

## Setup Commands:

Login to Azure with the cli:
```
az login
```

Verify correct account:
```
az account list
```

Verify correct subscription:
```
az account set --subscription ...
```

Set defaults:
```
./sh/setup-env-variables-jsp-demo-ent.sh
```

Create the group:
```
az group create --location eastus --resource-group azure-asa-useast-jl & 
```

Verify the group:
```
az group show --resource-group azure-asa-useast-jl
```

## Demo Commands:

Login to Azure with the cli:
```
az login
```

Set defaults:
```
. ../sh/setup-env-variables-jsp-demo-ent.sh
```

Register app within the service-instance [ent]. Note: Takes 10-15min to complete:
```
az spring app create -n jsp-demo -s jsp-demo-ent-jl \
	 -g azure-asa-useast-jl --assign-endpoint true \
	 --verbose &
```

Verify the app [ent]:
```
az spring app list  -s jsp-demo-ent-jl -g azure-asa-useast-jl
```

Invoke maven build:
```
mvn clean install
```

Deploy the app [ent]:
```
az spring app deploy -n jsp-demo -s jsp-demo-ent-jl -g azure-asa-useast-jl \
   --artifact-path ./target/jsp-demo-0.0.1-SNAPSHOT.war \
   --build-env BP_JVM_VERSION=17 \
   --verbose  &	
```

List the app [ent]:
```
az spring app list  -s jsp-demo-ent-jl -g azure-asa-useast-jl
```

Get logs [ent]:
```
az spring app logs -n jsp-demo -s jsp-demo-ent-jl -g azure-asa-useast-jl --lines 100 -f
```

Hit the app [ent]:

```
https://jsp-demo-ent-jl-jsp-demo.azuremicroservices.io/showDateTime
```

```
curl -v https://jsp-demo-ent-jl-jsp-demo.azuremicroservices.io/showDateTime
```

Scale the app [ent]:
```
az spring app scale -n jsp-demo -s jsp-demo-ent-jl -g azure-asa-useast-jl --instance-count 3
```

Delete the app [ent]:
```
az spring app delete -n jsp-demo -s jsp-demo-ent-jl -g azure-asa-useast-jl &
```

## teardown

az group delete --location eastus --resource-group azure-asa-useast-jl 
