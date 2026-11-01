import { RulesPageLayout } from "@/components/rules-page-layout"
import { TeeingAreaSection } from "@/components/teeing-area-section"

export default function TeeingAreaPage() {
  return (
    <RulesPageLayout title="Mesas de salida">
      <TeeingAreaSection />
      <nav aria-label="Navegación entre secciones" className="flex">
        <a href="/dashboard/bases-y-dropear" className="rounded-lg border px-4 py-2 text-sm font-semibold text-emerald-800 transition hover:bg-emerald-50">← Bases y dropear</a>
      </nav>
    </RulesPageLayout>
  )
}
