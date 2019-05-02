## Admin Panel

- username: netcorecms@dotnetcorecms.com
- password: Admin12#

### Command line
(Run the commands as an Administrator)

- Install the latest versions (current) for .Net Core Runtime and SDK from https://www.microsoft.com/net/download/core
- Call `dotnet restore`.
- Call `dotnet build`.
- Navigate to `D:\NetCoreCMS\NetCoreCMS.Web` or to the respective folder. 
- Call `dotnet run`.
- Open the `http://localhost:5000` URL in your browser.

### Visual Studio 2017

- Download Visual Studio 2017 (any edition) from https://www.visualstudio.com/downloads/
- Open `NetCoreCMS.sln`
- Build `NetCoreCMS.sln` solution (before running the project)
- Ensure `NetCoreCMS.Web` is the startup project and run it.

### Common Mistakes
- Build module project after changing the module else module will not work.
- If make any mistake at installation period and project does not run then delete setup.json from root directory and run project again.
- After install/uninstall any module or theme restart project.
