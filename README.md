## What is this project?
This project was created to facilitate the execution of the tutorial found **here** on how to create a basic configuration on the SQL Server Reporting Services (SSRS).

Here you will found a docker compose file that will create a container containing:

-  a .NET 7 application (running on linux) configured to show a report from the server after it is configured;
- a SQL Server 2022 (Developer Edition) (running on linux)

We also have on this project:
- a .bak file that will be used to import some data to our database.
- a .rdl file on the folder Reports that can be used to be imported on the Report Server after its configuration.

Please, download the .bak file through this link https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2022.bak and add it to the root folder.

##Important files
**docker-compose.yml**: this file is used to create a container containing our SQL Server and application. 

**entrypoint.sh**: this file is used to copy our .bak file to the container and run the .sql file that imports its content. 

**setup.sql**: this file has the SQL code to import our database

##How to execute this project

###[Docker](https://docs.docker.com/desktop/install/windows-install/)
You need to have docker installed on your machine.

Run *docker-compose up --build* and it will create your container.

**This tutorial is still under construction**

Other sources:

[AdventureWorks database and how to restore it with T-SQL](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=tsql)
[Download SQL Server Management Studio](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver16)
[The web portal of a report server (SSRS Native Mode)](https://learn.microsoft.com/en-us/sql/reporting-services/web-portal-ssrs-native-mode?view=sql-server-ver16)
[Integrating Reporting Services Using URL Access - Web Application](https://learn.microsoft.com/en-us/sql/reporting-services/application-integration/integrating-reporting-services-using-url-access-web-application?view=sql-server-ver16)
