-- SBT-DF205 Case Study 1: Android Forensics
-- Purpose: document representative read-only examination queries.
-- Run against working copies only. Preserve database WAL/SHM sidecars.
-- Database paths below are relative to 02_working/Pixel 3.

-- 1. Check SQLite database integrity.
-- Run separately for each database:
-- PRAGMA integrity_check;

-- 2. AOSP SMS: inspect message metadata and content.
-- Database:
-- data/data/com.android.providers.telephony/databases/mmssms.db
SELECT _id, thread_id, address, date, type, body
FROM sms
ORDER BY date;

-- 3. AOSP MMS: inspect message-box and MMS type metadata.
SELECT _id, thread_id, date, msg_box, m_type, sub
FROM pdu
ORDER BY date;

-- 4. Contacts: identify stored contact display names.
-- Database:
-- data/data/com.android.providers.contacts/databases/contacts2.db
SELECT _id, display_name
FROM contacts
ORDER BY _id;

-- 5. Call log: inspect call records.
-- Database:
-- data/data/com.android.providers.contacts/databases/calllog.db
SELECT _id, number, date, duration, type, deleted
FROM calls
ORDER BY date;

-- 6. Calendar: check whether event records are present.
-- Database:
-- data/data/com.android.providers.calendar/databases/calendar.db
SELECT COUNT(*) AS event_count
FROM Events;

-- 7. Google Messages: inspect message metadata.
-- Database:
-- data/data/com.google.android.apps.messaging/databases/bugle_db
-- Confirm the schema before running this query.
SELECT
    _id AS message_id,
    conversation_id,
    participant_id,
    received_timestamp,
    sent_timestamp
FROM messages
ORDER BY received_timestamp;

-- Schema varies by application version; inspect first:
-- .tables
-- PRAGMA table_info(messages);

-- 9. TextNow: inspect stored messages.
-- Database:
-- data/data/com.enflick.android.TextNow/databases/textnow_data.db
-- Schema varies by application version; inspect first:
-- .tables
-- PRAGMA table_info(messages);

-- 10. Kik: inspect stored chat messages.
-- Database: <KIK_DATABASE_FILENAME>
-- Schema varies by application version; inspect first:
-- .tables
-- PRAGMA table_info(messagesTable);
-- 11. Google Photos: inspect local media and available location metadata.
-- Database:
-- data/data/com.google.android.apps.photos/databases/gphotos0.db
SELECT _id, filename, filepath, capture_timestamp,
       utc_timestamp, latitude, longitude, size_bytes
FROM local_media
ORDER BY capture_timestamp;

-- 12. Google Maps: inspect stored coordinate-bearing sync records.
-- Database:
-- data/data/com.google.android.apps.maps/databases/gmm_myplaces.db
SELECT corpus, key_string, timestamp, latitude, longitude, is_local
FROM sync_item
ORDER BY timestamp;

-- 13. Google Messages: examine message metadata and sender references.
-- Database:
-- data/data/com.google.android.apps.messaging/databases/bugle_db
-- Confirm the schema before running this query.
SELECT
    _id AS message_id,
    conversation_id,
    sender_id,
    received_timestamp,
    sent_timestamp
FROM messages
ORDER BY
    CASE
        WHEN sent_timestamp > 0 THEN sent_timestamp
        ELSE received_timestamp
    END,
    _id;
