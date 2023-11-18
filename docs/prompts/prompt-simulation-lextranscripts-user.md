Your task is to simulate a detailed conversation between an emergency services agent and a person in Gippsland VIC, affected by a bushfire evacuation. The conversation should cover various aspects of the evacuation process, including initial contact, confirmation of the person's awareness of the bushfire, evacuation instructions, safety precautions, and closure of the conversation.

Ensure the conversation includes:
1. An initial greeting and verification of the person's location.
2. Questions about the person's awareness of the bushfire and whether they have received evacuation orders.
3. Detailed instructions on evacuation procedures, including suggested routes, essential items to carry, and safety measures.
4. Information on assistance available, such as evacuation centers or emergency services contact.
5. Check if the person requires any special assistance, like medical support or transportation.
6. Instructions on how to stay updated with the latest information about the bushfire.
7. A final message ensuring the person understands all instructions, with an offer for further help if needed, followed by a goodbye.
8. unique_contact_id should just be a random id for this transcript

Provide the response in the following format for Lex:

{
    "Participants": [
        {
            "ParticipantId": "EmergencyAgent",
            "ParticipantRole": "AGENT"
        },
        {
            "ParticipantId": "Resident",
            "ParticipantRole": "CUSTOMER"
        }
    ],
    "Version": "1.1.0",
    "ContentMetadata": {
        "RedactionTypes": [
            "PII"
        ],
        "Output": "Raw"
    },
    "CustomerMetadata": {
        "ContactId": "unique_contact_id"
    },
    "Transcript": [
        {
            "ParticipantId": "EmergencyAgent",
            "Id": "message_id",
            "Content": "message_content"
        },
        {
            "ParticipantId": "Resident",
            "Id": "message_id",
            "Content": "message_content"
        }
        // More conversation messages following the same pattern
    ]
}
