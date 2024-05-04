# Use an official .NET SDK as a parent image for building
FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build

# Set the working directory to /app
WORKDIR /app

# Copy the source code into the container at /app
COPY . .

# Build the application inside the container
RUN dotnet publish -c Release -o out

# Use an official .NET runtime as a parent image for runtime
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS runtime

# Set the working directory to /app and copy the published output from build stage
WORKDIR /app
COPY --from=build /app/out .

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV ASPNETCORE_URLS http://*:80

# Run the application when the container launches
ENTRYPOINT ["dotnet", "smtp4dev.dll"]
