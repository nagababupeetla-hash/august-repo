FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime

WORKDIR /app

EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /src

COPY ["DevOpsDemo/DevOpsDemo.csproj", "DevOpsDemo/"]

RUN dotnet restore "DevOpsDemo/DevOpsDemo.csproj"

COPY . .

WORKDIR "/src/DevOpsDemo"

RUN dotnet publish "DevOpsDemo.csproj" -c Release -o /app/publish

FROM runtime AS final

WORKDIR /app

COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "DevOpsDemo.dll"]
