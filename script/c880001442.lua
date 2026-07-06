-- AUTO-GENERATED: OP11-108 / 넵튠
-- rules_id=OP11-108 script_id=880001442 fingerprint=f3885d1bc40283923e17aaccd7b66cbb636017cf7f1221f007ff6f8ede5d5556
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-108]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
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
        source_text=[[【등장 시】자신의 리더가 「시라호시」인 경우, 자신의 라이프 위에서 1장을 뒷면으로 할 수 있다: 카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-108]],
    schema_version=1,
  })
end
