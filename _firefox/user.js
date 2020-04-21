//-------------
//  INTERFACE
//-------------

// Smooth scrolling.
user_pref("general.smoothScroll.msdPhysics.enabled", true);

// Allow maximum number of font replacements.
user_pref("gfx.font_rendering.fontconfig.max_generic_substitutions", 127);

// Hardware acceleration.
user_pref("layers.acceleration.force-enabled", true);  // OpenGL Off-Main-Thread Compositing.
user_pref("gfx.webrender.all", true);                  // WebRender.
user_pref("gfx.canvas.azure.accelerated", true);       // Accelerated Azure Canvas.

// Disable restoring after crash.
user_pref("browser.sessionstore.resume_from_crash", false);

// Draw content using light GTK theme.
user_pref("widget.content.gtk-theme-override", "Adwaita:light");

// Remove full screen warning.
user_pref("full-screen-api.warning.timeout", 0);

// Don't hide tabs in full screen mode.
user_pref("browser.fullscreen.autohide", false);


//-----------
//  PRIVACY
//-----------

// Use CloudFlare DNS-over-HTTPS when possible.
user_pref("network.trr.mode", 2);
user_pref("network.trr.uri", "https://family.cloudflare-dns.com/dns-query/");

// Disable geolocation.
user_pref("geo.enabled", false);

// Disable download checking.
user_pref("browser.safebrowsing.downloads.enabled", false);

// Enable address autofill.
user_pref("extensions.formautofill.available", "on");


//------------------
//  JAPANESE FONTS
//------------------

user_pref("font.cjk_pref_fallback_order", "ja,zh-cn,zh-hk,zh-tw,ko");
user_pref("font.name.sans-serif.ja", "Source Han Sans JP");
user_pref("font.name.serif.ja", "Source Han Serif JP");
user_pref("font.name.monospace.ja", "Cousine");
user_pref("font.size.monospace.ja", 13);
