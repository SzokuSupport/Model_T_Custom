$('#amlcc-allow').ready( function ()
{
    console.info("Consent listen");
    // If the Asiamiles Consent Banner has appear

    // Lisent to the accept button
    $('#amlcc-allow').click(
        function (event)
        {
            givenCdsConsent ();
        }
    )
});


$(document).ready(
    function()
    {

        var amlConsent = Cookies.get('aml_cc_advertising');

        var cdsConsentGiven = Cookies.get('profile.consent.given');
        var cdsConsentPause = Cookies.get('profile.tracking.pause');

        console.log("debug amlConsent = " + amlConsent + " cdsConsent:" + cdsConsentGiven  );

        if ( ( !amlConsent || amlConsent == '0' ) &&  // Consent from AML is disabled.
                        cdsConsentGiven == 'true' ) // Verify CDS Consents at the moment

        {
            withdrawCdsConsent ();
        }


        if ( (amlConsent == '1') && // Consent from AML is enabled.
            ( !cdsConsentGiven || cdsConsentGiven == 'false'  ) ) // If CDS consent is not given
        {
            givenCdsConsent();
        }

    }
);

function givenCdsConsent () {
    // Determins if this is anonymous user
    $.ajax({
        url: ACC.config.encodedContextPath+"/profile-consent?consentState="+encodeURIComponent("GIVEN"),
        type: 'POST',
        success: function () {
            console.info("Consent Given");
        }
    });
}



function withdrawCdsConsent () {
    // Determins if this is anonymous user
    $.ajax({
        url: ACC.config.encodedContextPath+"/profile-consent?consentState="+encodeURIComponent("WITHDRAWN"),
        type: 'POST',
        success: function () {
            console.info("Consent Withdraw");
        }
    });
}
