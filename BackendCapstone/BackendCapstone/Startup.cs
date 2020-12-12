 using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using BackendCapstone.DataAccess;
using BackendCapstone.Models;

namespace BackendCapstone
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();

            //ANCA: added this to configure what gets provided when a request is made for configuration:
            services.AddSingleton<IConfiguration>(Configuration);
            services.AddTransient<AgeRepository>();
            services.AddTransient<GameAgeRepository>();
            services.AddTransient<GameIconRepository>();
            services.AddTransient<GameInstrumentRepository>();
            services.AddTransient<GameRepository>();
            services.AddTransient<GameWithMetadataRepository>();
            services.AddTransient<InstrumentRepository>();
            services.AddTransient<PracticePlanGameRepository>();
            services.AddTransient<PracticePlanGameWithGameNameRepository>();
            services.AddTransient<PracticePlanRepository>();
            services.AddTransient<PreworkLevelRepository>();
            services.AddTransient<UserChildRepository>();
            services.AddTransient<UserPhotoRepository>();
            services.AddTransient<UserRatingRepository>();
            services.AddTransient<UserRepository>();
            services.AddTransient<UserReviewRepository>();

            //adding code block below to support authentication via Firebase:
            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                .AddJwtBearer(options =>
                {
                    options.IncludeErrorDetails = true;
                    options.Authority = "https://securetoken.google.com/backendcapstone-bccf6";
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateLifetime = true,
                        ValidateAudience = true,
                        ValidateIssuer = true,
                        ValidAudience = "backendcapstone-bccf6",
                        ValidIssuer = "https://securetoken.google.com/backendcapstone-bccf6"
                    };
                });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthentication();

            app.UseAuthorization();

            // Added CORS requests below to connect to frontend application:

            app.UseCors(policy => policy.AllowAnyHeader().AllowAnyOrigin().AllowAnyMethod());

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
