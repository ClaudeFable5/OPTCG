-- AUTO-GENERATED: OP02-085 / 마젤란
-- rules_id=OP02-085 script_id=880000330 fingerprint=52262ba702ac1ab6b2704812aadeafcc98b3ad929601929494ef9bbc34f651ad
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-085]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[EXACT]],
            op=[[RETURN_DON]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 상대는 자신 필드의 두웅!! 1장을 두웅!! 덱으로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=2,
            mode=[[EXACT]],
            op=[[RETURN_DON]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            op=[[OPPONENT_TURN]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】이 캐릭터가 KO 당했을 때, 상대는 자신 필드의 두웅!! 2장을 두웅!! 덱으로 되돌린다.]],
        timings={
          [[ON_SELF_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-085]],
    schema_version=1,
  })
end
