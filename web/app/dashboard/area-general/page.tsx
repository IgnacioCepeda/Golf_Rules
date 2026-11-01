import { GeneralAreaSection } from "@/components/general-area-section"
import { RulesPageLayout } from "@/components/rules-page-layout"

export default function GeneralAreaPage() {
  return <RulesPageLayout title="Área general del campo"><GeneralAreaSection /><nav aria-label="Navegación entre secciones" className="flex"><a href="/dashboard/mesa-de-salida" className="rounded-lg border px-4 py-2 text-sm font-semibold text-emerald-800 transition hover:bg-emerald-50">← Mesas de salida</a></nav></RulesPageLayout>
}
