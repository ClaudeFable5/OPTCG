-- AUTO-GENERATED: OP14-050 / 츄
-- rules_id=OP14-050 script_id=880002215 fingerprint=cf3d05c6074786ee15ac5db640810939f89c0ad6cee08329d369f3d55c1fe50d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-050]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[어인족]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《어인족》 특징을 가진 경우, 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-050]],
    schema_version=1,
  })
end
