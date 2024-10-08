FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /app
COPY Backend-Lab1-ProjectTemplate/Backend-Lab1-ProjectTemplate.csproj ./
RUN dotnet restore
COPY . ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/out ./
EXPOSE 80

ENTRYPOINT ["dotnet", "Backend-Lab1-ProjectTemplate.dll"]