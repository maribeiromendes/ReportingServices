#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
# RUN dotnet dev-certs https
# RUN sed -i 's/TLSv1.2/TLSv1/g' /etc/ssl/openssl.cnf
WORKDIR /app
EXPOSE 80
# EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["Zcelero.ReportingServices/Zcelero.ReportingServices.csproj", "."]
RUN dotnet restore "./Zcelero.ReportingServices.csproj"
COPY . .
WORKDIR "/src/Zcelero.ReportingServices/."
RUN dotnet build "Zcelero.ReportingServices.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Zcelero.ReportingServices.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Zcelero.ReportingServices.dll"]