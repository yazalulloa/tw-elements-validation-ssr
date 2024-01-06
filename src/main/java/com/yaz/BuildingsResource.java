package com.yaz;

import com.yaz.domain.FormDto;
import io.quarkus.qute.CheckedTemplate;
import io.quarkus.qute.TemplateInstance;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path("/api/buildings")
public class BuildingsResource {

  @CheckedTemplate
  public static class Templates {

    public static native TemplateInstance form(FormDto dto);
  }

  @GET
  @Path("new")
  @Produces(MediaType.TEXT_HTML)
  public TemplateInstance get() {
    return Templates.form(new FormDto(true, false));
  }

  @POST
  @Path("new")
  @Produces(MediaType.TEXT_HTML)
  public TemplateInstance post() {
    return Templates.form(new FormDto(false, true));
  }
}
