"""
Regression test for SQLITE_BUSY_SNAPSHOT (error 261) under concurrent writes.
Verifies that AlmacenMemoria handles concurrent access without raising
"database is locked" OperationalError.
"""
import sqlite3
import tempfile
import threading

import pytest

from cortex.sovereign.memoria import AlmacenMemoria


def test_concurrent_writes_do_not_raise_database_locked():
    """50 concurrent writers to the same AlmacenMemoria must not raise OperationalError."""
    with tempfile.NamedTemporaryFile(suffix=".db", delete=False) as f:
        db_path = f.name

    memoria = AlmacenMemoria(db_path)
    errors: list[Exception] = []
    lock = threading.Lock()

    def write_fact(i: int) -> None:
        try:
            memoria.archivar_hecho(
                dominio=f"CONCURRENT_TEST_{i}",
                contenido=f"payload_{i}",
                exergia=0.9,
            )
        except sqlite3.OperationalError as exc:
            with lock:
                errors.append(exc)

    threads = [threading.Thread(target=write_fact, args=(i,)) for i in range(50)]
    for t in threads:
        t.start()
    for t in threads:
        t.join()

    assert not errors, (
        f"database locked under concurrent writes: {errors[0]}"
    )
