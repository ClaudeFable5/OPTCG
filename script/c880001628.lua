-- AUTO-GENERATED: OP13-056 / 리틀 오즈 Jr.
-- rules_id=OP13-056 script_id=880001628 fingerprint=ab9bfa3a5bc8bb19d498b97dd8fc20aee4cf81ec4d86971f96939d23f448d12b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-056]],
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
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[흰 수염 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 리더가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 카드를 1장 뽑는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-056]],
    schema_version=1,
  })
end
