Amazon S3: 
- Used for creating a data lake 
- Any file format for storage

S3 Durability and availability
Durability: how often you lose an object
- high durability(99.999999999%) of objects

Availability: how often it is availble
- 99.99% availability

Standard - General Purpose
- 99.99% availability 
- used ofr frequently accessed data
- low latency and high throughput
- ustain 2 concurrent facility failures
- use case: big data analytics mobile and gaming applications and content distribution

S3 Storage Classes - Infrequent Access
- ﻿﻿For data that is less frequently accessed, but requires rapid access when needed
- ﻿﻿Lower cost than S3 Standard
- ﻿﻿Amazon S3 Standard-Infrequent Access (S3 Standard-IA)
- ﻿﻿99.9% Availability
- ﻿﻿Use cases: Disaster Recovery, backups
- ﻿﻿Amazon S3 One Zone-Infrequent Access (S3 One Zone-IA)
- ﻿﻿High durability (99.999999999%) in a single AZ; data lost when AZ is destroyed
- ﻿﻿99.5% Availability
- ﻿﻿Use Cases: Storing secondary backup copies of on-premise data, or data you can recreate

Amazon S3 Glacier Storage Classes
- ﻿﻿Low-cost object storage meant for archiving / backup
- ﻿﻿Pricing: price for storage + object retrieval cost
- ﻿﻿Amazon S3 Glacier Instant Retrieval
- ﻿﻿Millisecond retrieval, great for data accessed once a quarter
- ﻿﻿Minimum storage duration of 90 days
- ﻿﻿Amazon S3 Glacier Flexible Retrieval (formerly Amazon S3 Glacier):
- ﻿﻿Expedited (I to 5 minutes), Standard (3 to 5 hours), Bulk (5 to 12 hours) - free
- ﻿﻿Minimum storage duration of 90 days
- ﻿﻿Amazon S3 Glacier Deep Archive - for long term storage:
- ﻿﻿Standard (12 hours), Bulk (48 hours)
- ﻿﻿Minimum storage duration of 180 days

S3 Intelligent-Tiering

- ﻿﻿Small monthly monitoring and auto-tiering fee
- ﻿﻿Moves objects automatically between Access Tiers based on usage
- ﻿﻿There are no retrieval charges in S3 Intelligent-Tiering
- ﻿﻿Frequent Access tier (automatic): default tier
- ﻿﻿Infrequent Access tier (automatic): objects not accessed for 30 days
- ﻿﻿Archive Instant Access tier (automatic): objects not accessed for 90 days
- ﻿﻿Archive Access tier (optional): configurable from 90 days to 700+ days
- ﻿﻿Deep Archive Access tier (optional): config. from 180 days to 700+ days