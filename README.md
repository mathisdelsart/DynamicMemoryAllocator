<div align="center">

# Dynamic Memory Allocator in C

![C](https://img.shields.io/badge/C-99-blue.svg)
![Make](https://img.shields.io/badge/Make-Build-orange.svg)
![License](https://img.shields.io/badge/License-Academic-yellow.svg)

**A dynamic heap-based memory allocator with dynamic allocation and coalescing**

[About](#about) • [Features](#features) • [Usage](#usage) • [Implementation](#implementation)

</div>

---

## About

This project implements a **dynamic memory management system** from scratch in C, featuring dynamic allocation, deallocation, and automatic free block coalescing. Built as part of the LINFO1252 course at UCLouvain, this allocator provides a practical exploration of heap management, memory fragmentation, and allocation strategies.

### Core Concept

```
Memory Efficiency = minimize(fragmentation) + optimize(allocation_speed) + maximize(locality)
```

The allocator uses a **next-fit strategy** with metadata-driven block management to efficiently handle allocation requests while maintaining heap integrity through automatic coalescing of adjacent free blocks.

---

## Features

### Memory Allocation System

#### `my_malloc(size)`
- **Next-fit allocation** with wraparound search
- Automatic block splitting when oversized blocks are found
- Metadata management (2-byte headers per block)
- Returns pointer to usable memory region

#### `my_free(ptr)`
- Safe deallocation with boundary checking
- **Automatic coalescing** of adjacent free blocks
- Merges forward to reduce fragmentation
- Updates allocation metadata

#### `print_HEAP()`
- Visual heap state inspector
- Displays allocated vs. free blocks
- Shows block sizes and locations
- Debugging aid for memory visualization

### Technical Specifications

| **Property** | **Value** |
|--------------|-----------|
| Heap Size | 64,000 bytes |
| Header Size | 2 bytes per block |
| Allocation Strategy | Next-fit with coalescing |
| Fragmentation Control | Forward block merging |

---

## Usage

### Prerequisites

- GCC compiler
- Unix-like environment (Linux, macOS)
- Make utility

### Installation & Execution

```bash
# Clone the repository
git clone https://github.com/mathisdelsart/DynamicMemoryAllocator.git
cd DynamicMemoryAllocator

# Build and run
make all

# Or step by step
make build    # Compile only
make run      # Execute the program
make clean    # Remove generated files

# View available commands
make help
```

### Example Output

The program runs a series of allocation and deallocation tests, printing the heap state after each operation:

```
========== Initial Heap State ==========
Block 0: FREE (63996 bytes)

========== After malloc(100) ==========
Block 0: ALLOCATED (100 bytes)
Block 102: FREE (63894 bytes)

========== After free(ptr) ==========
Block 0: FREE (63996 bytes)  [Coalesced]
```

---

## Implementation

### Architecture

```
memory-allocator/
├── memory_management.c    # Core allocator implementation
├── memory_management.h    # Public API and data structures
├── Makefile              # Build automation
├── README.md             # This file
└── assets/               # Documentation resources
    └── html_code/        # Heap state visualizations
```

### Key Algorithms

#### Allocation (Next-Fit)

```c
1. Start from last allocation position (nextfit)
2. Search for first adequate free block
3. If found:
   - Split block if oversized
   - Mark as allocated
   - Update nextfit pointer
4. If not found and not looped:
   - Wrap to beginning
   - Repeat search
5. Return pointer or NULL
```

#### Deallocation with Coalescing

```c
1. Mark block as free
2. Scan forward for adjacent free blocks
3. Merge consecutive free blocks:
   - Update size metadata
   - Remove intermediate headers
4. Update heap structure
```

---

---

## Authors

<div align="center">

<table>
  <tr>
    <td width="180" align="left">
      <img src="https://img.shields.io/badge/GitHub-mathisdelsart-black?logo=github" valign="middle"/>
    </td>
    <td align="left">
      <strong>Mathis DELSART</strong>
    </td>
  </tr>
  <tr>
    <td width="180" align="left">
      <img src="https://img.shields.io/badge/GitHub-backAir-black?logo=github" valign="middle"/>
    </td>
    <td align="left">
      <strong>Anthony GUERRERO GURRIARAN</strong>
    </td>
  </tr>
</table>

</div>

## License

This project is developed for academic purposes as part of university coursework.

---

<div align="center">

**Built for LINFO1252 - Systèmes informatiques @ UCLouvain** (Université catholique de Louvain).

</div>