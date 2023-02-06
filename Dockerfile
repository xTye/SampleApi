FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env
WORKDIR /SampleApi

# Copy everything
COPY *.csproj ./
# Restore as distinct layers
RUN dotnet restore

COPY . ./
# Build and publish a release
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /SampleApi
EXPOSE 80
EXPOSE 443
COPY --from=build-env /SampleApi/out .
ENTRYPOINT ["dotnet", "SampleApi.dll"]