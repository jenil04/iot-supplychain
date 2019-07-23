pragma solidity ^0.4.22;

contract Certificate {
    
    struct iotCert {
        // Owner's address.
        address owner;

        // Certificate metadata
        string RFID;
        uint   DeviceID;
        string firmwareVersion;

        // date when the certificate was assigned.
        uint issue_date;
    }
    
    iotCert[] public iotCertificates;

    /**
    * @dev Constructor sets the original `owner` of the contract to the sender account, and
    * commits the certificate details to the blockchain
    */
    function issueCert(uint id, address _owner, string _RFID, uint _DeviceID, string _firmwareVersion, uint _issue_date) public {
        // Setting the amount of certificates for testing.
        iotCertificates.length = 100;
        
        iotCertificates[id].owner = _owner;
        iotCertificates[id].RFID = _RFID;
        iotCertificates[id].DeviceID = _DeviceID;
        iotCertificates[id].firmwareVersion = _firmwareVersion;
        iotCertificates[id].issue_date = _issue_date;

    }

    /**
    * @dev returns contract metadata in one function call, rather than separate .call()s
    */
    function getCertificateDetails(uint id) public view returns (
        address, string, uint, string, uint) {
        return (
            iotCertificates[id].owner,
            iotCertificates[id].RFID,
            iotCertificates[id].DeviceID,
            iotCertificates[id].firmwareVersion,
            iotCertificates[id].issue_date
            );
    }
    
}
