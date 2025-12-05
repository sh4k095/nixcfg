{
  flake.modules.nixos.firefox = { config, pkgs, ... }:  {
    programs.firefox = {
      enable = true;
      preferencesStatus = "locked";
  
      policies = {
        AppAutoUpdate = false;
        AutofillCreditCardEnabled = false;
        DisableFirefoxAccounts = true;
        DisableFirefoxStudies = true;
        DisableFormHistory = true;
        DisableMasterPasswordCreation = true;
        DisablePocket = true;
        DisableProfileImport = true;
        DisableTelemetry = true;
        DisplayBookmarksToolbar = "never";
        DNSOverHTTPSMode.Enabled = true;
        DontCheckDefaultBrowser = true;
        EnableDoNotTrack = true;
        Handlers.mimeTypes."application/pdf" = {
          action = "useSystemDefault";
          ask = false;
          description = "Portable Document Format";
        };
        Homepage.StartPage = "previous-session";
        HttpsOnlyMode = "enabled";
        NoDefaultBookmarks = true;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        PasswordManagerEnabled = false;
        Preferences = {
          "browser.newtabpage.activity-stream.showSponsored".Value = false;
          "browser.newtabpage.activity-stream.system.showSponsored".Value = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites".Value = false;
          "browser.newtabpage.pinned".Value = "";
          "browser.search.defaultenginename".Value = "DuckDuckGo";
          "browser.search.order.1".Value = "DuckDuckGo";
          "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines".Value = "DuckDuckGo";
          "browser.search.suggest.enabled".Value = false;
          "browser.tabs.warnOnClose".Value = false;
          "browser.topsites.contile.enabled".Value = false;
          "browser.translations.enable".Value = true;
          "browser.translations.automaticallyPopup".Value = true;
          "browser.translations.neverTranslateLanguages".Value = "en,it";
          "extensions.pocket.enabled".Value = false;
          "geo.enabled".Value = false;
          "privacy.sanitize.sanitizeOnShutdown".Value = false;
          "widget.use-xdg-desktop-portal.file-picker".Value = true;
        };
        SearchBar = "unified";
        SearchEngines = {
          Default = "DuckDuckGo";
          PreventInstalls = true;
          Add = [
            {
              Alias = "@np";
              Description = "Search in NixOS Packages";
              IconURL = "https://nixos.org/favicon.ico";
              Method = "GET";
              Name = "NixOS Packages";
              URLTemplate = "https://search.nixos.org/packages?from=0&size=200&channel=unstable&sort=relevance&type=packages&query={searchTerms}";
            }
            {
              Alias = "@no";
              Description = "Search in NixOS Options";
              IconURL = "https://nixos.org/favicon.ico";
              Method = "GET";
              Name = "NixOS Options";
              URLTemplate = "https://search.nixos.org/options?from=0&size=200&sort=relevance&type=packages&query={searchTerms}";
            }
            {
              Alias = "@hm";
              Description = "Search Home Manager Options";
              IconURL = "https://nixos.org/favicon.ico";
              Method = "GET";
              Name = "Home Manager Options";
              URLTemplate = "https://home-manager-options.extranix.com/options?from=0&size=200&sort=relevance&type=packages&query={searchTerms}";
            }
            {
              Alias = "@mn";
              Description = "Search on MyNixOS";
              IconURL = "https://mynixos.com/favicon.ico";
              Method = "GET";
              Name = "MyNixOS";
              URLTemplate = "https://mynixos.com/search?q={searchTerms}";
            }
            {
              Alias = "@nd";
              Description = "Search NixOS Discourse";
              IconURL = "https://discourse.nixos.org/uploads/default/optimized/1X/401be373869e12dfe689b9d7eb347f78b1a105f0_2_32x32.png";
              Method = "GET";
              Name = "NixOS Discourse";
              URLTemplate = "https://discourse.nixos.org/search?q={searchTerms}";
            }
            {
              Alias = "@nw";
              Description = "Search NixOS Wiki";
              IconURL = "https://wiki.nixos.org/favicon.ico";
              Method = "GET";
              Name = "NixOS Wiki";
              URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
            }
            {
              Alias = "@gh";
              Description = "Search on GitHub";
              IconURL = "https://github.com/favicon.ico";
              Method = "GET";
              Name = "GitHub";
              URLTemplate = "https://github.com/search?q={searchTerms}&type=repositories";
            }
            {
              Alias = "@wp";
              Description = "Search on Wikipedia";
              IconURL = "https://en.wikipedia.org/favicon.ico";
              Method = "GET";
              Name = "Wikipedia";
              URLTemplate = "https://en.wikipedia.org/w/index.php?search={searchTerms}";
            }
            {
              Alias = "@yt";
              Description = "Search on YouTube";
              IconURL = "https://www.youtube.com/favicon.ico";
              Method = "GET";
              Name = "YouTube";
              URLTemplate = "https://www.youtube.com/results?search_query={searchTerms}";
            }
            {
              Alias = "@gl";
              Description = "Search on GitLab";
              IconURL = "https://gitlab.com/favicon.ico";
              Method = "GET";
              Name = "GitLab";
              URLTemplate = "https://gitlab.com/search?search={searchTerms}";
            }
            {
              Alias = "@so";
              Description = "Search on Stack Overflow";
              IconURL = "https://stackoverflow.com/favicon.ico";
              Method = "GET";
              Name = "Stack Overflow";
              URLTemplate = "https://stackoverflow.com/search?q={searchTerms}";
            }
          ];
        };
        SkipTermsOfUse = true;
        ExtensionSettings = {
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
            updates_disabled = true;
          };
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = false;
            updates_disabled = true;
          };
          "jid1-MnnxcxisBPnSXQ@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
            updates_disabled = true;
          };
          "sponsorBlocker@ajay.app" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4608179/sponsorblock-6.1.0.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
            updates_disabled = true;
          };
          "{1018e4d6-728f-4b20-ad56-37578a4de76b}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4609492/flagfox-6.1.92.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
            updates_disabled = true;
          };
          "extension@tabliss.io" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/3940751/tabliss-2.6.0.xpi";
            installation_mode = "force_installed";
            private_browsing = false;
            updates_disabled = true;
          };
          "wayback_machine@mozilla.org" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/file/4047136/wayback_machine_new-3.2.xpi";
            installation_mode = "force_installed";
            private_browsing = true;
            updates_disabled = true;
          };
        };
      };
    };
  };
}
