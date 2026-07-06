-- AUTO-GENERATED: OP11-100 / 오토히메
-- rules_id=OP11-100 script_id=880001434 fingerprint=83ecd3158e357ef491ef5d388d3500df02c058613deb798d31fba357014c227d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-100]],
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
            name=[[시라호시]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            faceup=false,
            op=[[FLIP_LIFE_TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「시라호시」인 경우, 자신의 라이프 위에서 1장을 뒷면으로 할 수 있다: 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-100]],
    schema_version=1,
  })
end
