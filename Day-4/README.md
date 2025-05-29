# Day 4 - .NET and PostgreSQL Connection Setup

## Overview

This folder contains the code and setup instructions for connecting a .NET application with a PostgreSQL database.

## Steps to Build Connection

1. **Install PostgreSQL**

   - Make sure PostgreSQL is installed and running on your machine.
   - Create a database to use for your .NET app.

2. **Configure Connection String**

   - In your `.NET` project, locate the `appsettings.json` file.
   - Add or update the connection string like this:
     ```json
     "ConnectionStrings": {
       "DefaultConnection": "UserId=yourusername;Password=yourpassword;Host=localhost;Database=yourdbname"
     }
     ```
   - Replace `yourusername`, `yourpassword`, and `yourdbname` with your PostgreSQL credentials and database name.

3. **Setup DbContext in .NET**

   - Use `Entity Framework Core` with Npgsql provider.
   - Register your `DbContext` in `Program.cs` or `Startup.cs`:
     ```csharp
     builder.Services.AddDbContext<YourDbContext>(options =>
         options.UseNpgsql(builder.Configuration.GetConnectionString("DefaultConnection")));
     ```

4. **Run Migrations (if using EF Core)**

   - Use the following commands to create and apply migrations:
     ```bash
     dotnet ef migrations add InitialCreate
     dotnet ef database update
     ```

5. **Test the connection**
   - Run your application and ensure it connects to the PostgreSQL database successfully.

---

## Notes

- Make sure your PostgreSQL server allows connections from your .NET app.
- Use NuGet packages: `Npgsql.EntityFrameworkCore.PostgreSQL` for EF Core integration with PostgreSQL.
