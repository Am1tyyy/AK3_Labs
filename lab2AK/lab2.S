.global lab2
.syntax unified
.thumb

#define A #5
#define B #3
#define C #2

lab2:
    push {lr}           // Зберегти регістр повернення

    // Завантажити константи
    mov r0, A           // r0 = a
    mov r1, B           // r1 = b
    mov r2, C           // r2 = c

    // Обчислити a - b
    sub r3, r0, r1      // r3 = a - b

    // Перевірити, чи (a - b) >= 0
    cmp r3, #0
    bge calc_add        // Якщо (a - b) >= 0, перейти до calc_add
    bl calc_sub         // Інакше обчислити (a - b) / c
    b end

calc_add:
    // Обчислити (a + b) / c
    add r4, r0, r1      // r4 = a + b
    sdiv r5, r4, r2     // r5 = (a + b) / c
    b end

calc_sub:
    // Обчислити (a - b) / c
    sdiv r5, r3, r2     // r5 = (a - b) / c
    bx lr               // Повернутися

end:
    pop {pc}            // Повернутися до викликача
