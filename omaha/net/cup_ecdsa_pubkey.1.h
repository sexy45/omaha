// Copyright 2016 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ========================================================================
//
// CUP-ECDSA public keys consist of a byte array, 66 bytes long, containing:
// * The key ID (one byte)
// * The public key in X9.62 uncompressed encoding (65 bytes):
//     * Uncompressed header byte (0x04)
//     * Gx coordinate (256-bit integer, big-endian)
//     * Gy coordinate (256-bit integer, big-endian)
{0x01,
0x04,
0x69, 0xef, 0x5d, 0xeb, 0xb1, 0x2d, 0x40, 0x34, 
0xd6, 0x24, 0xb7, 0x10, 0xfd, 0x39, 0x32, 0x42, 
0x3c, 0x52, 0xb9, 0xca, 0x7e, 0x5d, 0x65, 0x03, 
0x47, 0xf0, 0xe9, 0xc1, 0xfe, 0x60, 0x4b, 0xa1, 
0x39, 0xe9, 0x96, 0x63, 0x3f, 0x72, 0x4a, 0x37, 
0x2e, 0x37, 0x50, 0xce, 0x38, 0xa5, 0x89, 0x1a, 
0x8c, 0x1f, 0x7f, 0xc7, 0xd6, 0xa4, 0x9a, 0x82, 
0x7e, 0xd8, 0x7e, 0x37, 0x4e, 0x5f, 0xb3, 0xbc};
