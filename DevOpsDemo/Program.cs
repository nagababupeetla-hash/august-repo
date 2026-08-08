var builder = WebApplication.CreateBuilder(args);

var app = builder.Build();

app.MapGet("/", () =>
{
    return "Hello from DevOps Demo - CI/CD Pipeline!";
});

app.Run();