import { BasicsDroppingSection } from "@/components/basics-dropping-section"
import { RulesPageLayout } from "@/components/rules-page-layout"

export default function BasicsDroppingPage() {
  return (
    <RulesPageLayout title="Bases y dropear">
      <BasicsDroppingSection />
      <nav aria-label="Navegación entre secciones" className="flex justify-end">
        <a href="/dashboard/mesa-de-salida" className="rounded-lg border px-4 py-2 text-sm font-semibold text-emerald-800 transition hover:bg-emerald-50">Mesas de salida →</a>
      </nav>
    </RulesPageLayout>
  )
}
