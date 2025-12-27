# Uso de los núcleos en porcentaje (por cada núcleo lógico)
import psutil

cpu_usage = psutil.cpu_percent(percpu=True)

print(f"Uso de los núcleos en porcentaje: {cpu_usage}")
