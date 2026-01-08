Amazon S3: 
- Used for creating a data lake 
- Any file format for storage

S3 Durability and availability
Durability: how often you lose an object
- high durability(99.999999999%) of objects

Availblility: how often it is availble
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