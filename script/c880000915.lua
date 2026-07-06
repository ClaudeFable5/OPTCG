-- AUTO-GENERATED: OP07-060 / 이토미미즈
-- rules_id=OP07-060 script_id=880000915 fingerprint=6cc8d8a8e3e2b203166dbff2069f4f6d1796b17bf76cead154f0b7de0a32d89b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-060]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[폭시 해적단]],
          },
          {
            name=[[이토미미즈]],
            op=[[OTHER_CHARACTER_NAME_ABSENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 리더가 《폭시 해적단》 특징을 가지고, 자신의 다른 「이토미미즈」가 없을 경우, 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-060]],
    schema_version=1,
  })
end
