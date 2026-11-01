import { GeneralAreaSection } from "@/components/general-area-section"
import { RulesPageLayout } from "@/components/rules-page-layout"
import { SectionNavigation } from "@/components/section-navigation"

export default function GeneralAreaPage() {
  return <RulesPageLayout title="Área general del campo"><GeneralAreaSection /><SectionNavigation previous={{ href: "/dashboard/mesa-de-salida", label: "Mesas de salida" }} next={{ href: "/dashboard/bunker", label: "Bunker" }} /></RulesPageLayout>
}
