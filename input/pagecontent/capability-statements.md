The following CapabilityStatements define the expected FHIR capabilities of systems implementing this implementation guide. Each module defines the required FHIR RESTful interactions, search parameters, and supported profiles.

### Module-Specific Capability Statements

#### Person Module
* [MII CPS Person CapabilityStatement](CapabilityStatement-mii-cps-person-capabilitystatement.html) - Defines the FHIR capabilities for the Person module

#### Treatment Case Module
* [MII CPS Fall CapabilityStatement](CapabilityStatement-mii-cps-fall-capabilitystatement.html) - Defines the FHIR capabilities for the Treatment Case module

#### Diagnosis Module
* [MII CPS Diagnose CapabilityStatement](CapabilityStatement-mii-cps-diagnose-capabilitystatement.html) - Defines the FHIR capabilities for the Diagnosis module

#### Procedure Module
* [MII CPS Prozedur CapabilityStatement](CapabilityStatement-mii-cps-prozedur-capabilitystatement.html) - Defines the FHIR capabilities for the Procedure module

---

Each CapabilityStatement specifies:
* **Server conformance requirements** - The FHIR resources and operations that must be supported
* **Required search parameters** - The search parameters that SHALL be implemented
* **Supported profiles** - The MII profiles that constrain the resources
* **RESTful interactions** - The create, read, update, delete, and search operations supported

For detailed implementation guidance, see the [Conformance](conformance.html) page.